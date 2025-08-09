use insurance;
-- KPI 1-No of Invoice by Account Exec
select `Account Executive`, count(invoice_number) as total_invoices from invoice group by `account executive` order by total_invoices desc;

-- KPI 2-Yearly Meeting Count
set sql_safe_updates = 0;
update meeting set meeting_date = str_to_date(meeting_date, '%d-%m-%Y');
select year(meeting_date) as meeting_year, count(*) as meeting_count from meeting group by meeting_year;

-- KPI 3.1Cross Sell--Target, Achieve, new
select * from `individual budgets`;
call IncomeClass('Cross Sell');
call IncomeClass('New');
call IncomeClass('Renewal');

-- KPI 4-Stage Funnel by Revenue
select stage, sum(revenue_amount) as total_revenue from opportunity group by stage order by total_revenue desc;

-- KPI 5-No of meeting By Account Exe
select `Account Executive`, count(*) as total_meetings from meeting group by `Account Executive` order by total_meetings desc;

-- KPI 6-Top Open Opportunity
select opportunity_name, `Account Executive`, revenue_amount from opportunity where stage in ('Propose Solution', 'Qualify Opportunity') order by revenue_amount desc limit 4;


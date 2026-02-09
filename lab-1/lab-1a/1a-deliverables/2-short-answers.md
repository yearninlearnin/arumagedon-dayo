## Short answers:
## A) Why is DB inbound source restricted to the EC2 security group?
- This is for best security purposes and resiliency, as the DB only lets the EC2 talk to it. Instead of using IP to access it, we link it to the EC2's security group. If the EC2's IP changes, the connection still works because the rule is tied to the security group, not the IP. And if someone tries to get into the database, they can't, unless their EC2 is tied to the same security group that is attached to the DB, and that is where the IAM permissions and policies kick in to further restrict and prevent damage, down the line.

## B) What port does MySQL use?

- ## 3306

## C) Why is Secrets Manager better than storing creds in code/user-data?
- Secrets Manager is better and instead of leaving our creds stagnant and unchangable (unless we like pain and will manually go in change a bunch of things around) inside our code, we can leverage the Secrets Manager to rotate the credentials without having to redeploy the app. I feel like this is similar to cyberark which will spit out a new password daily, so all automated.  Access is tracked through CloudTrail so you know who accessed the secrets and when. The IAM policy controls who can actually access the secrets. Much better than leaving that data exposed in the open.
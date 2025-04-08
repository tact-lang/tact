struct Flagged {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
}

contract TestContract {
    f: Flagged = Flagged{ flag1:false, flag2:true, flag3:false, flag4:true, flag5:false };
}
struct Sub {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract ManySubs {
    s1: Sub = Sub{f1:1,f2:true,f3:"x"};
    s2: Sub = Sub{f1:2,f2:false,f3:"y"};
    s3: Sub = Sub{f1:3,f2:true,f3:"z"};
}
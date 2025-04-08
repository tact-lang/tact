struct Nested {
    flag1: Bool;
    flag2: Bool?;
    text: String;
}

contract TestContract {
    first: Nested;
    second: Nested;
    third: Nested;

    init() {
        self.first = Nested{ flag1:true, flag2:null, text:"one" };
        self.second = Nested{ flag1:false, flag2:true, text:"two" };
        self.third = Nested{ flag1:true, flag2:false, text:"three" };
    }

    receive() {}
}
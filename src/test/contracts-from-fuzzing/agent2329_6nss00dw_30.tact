struct AS {
    a:Int;
}

contract ManyInstances {
    s1:AS;
    s2:AS;
    s3:AS;
    s4:AS;
    s5:AS;

    init() {
        self.s1=AS{a:1};
        self.s2=AS{a:2};
        self.s3=AS{a:3};
        self.s4=AS{a:4};
        self.s5=AS{a:5};
    }
}
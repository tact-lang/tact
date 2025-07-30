struct Small {
    a:Int;
}

contract ManySmall {
    s1:Small; s2:Small; s3:Small; s4:Small; s5:Small;
    s6:Small; s7:Small; s8:Small; s9:Small; s10:Small;

    init() {
        self.s1=Small{a:1}; self.s2=Small{a:2}; self.s3=Small{a:3};
        self.s4=Small{a:4}; self.s5=Small{a:5}; self.s6=Small{a:6};
        self.s7=Small{a:7}; self.s8=Small{a:8}; self.s9=Small{a:9}; self.s10=Small{a:10};
    }
}
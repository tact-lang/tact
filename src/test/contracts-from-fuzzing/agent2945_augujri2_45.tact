struct S {
    i: Int;
}

contract BigFields {
    f1:S;f2:S;f3:S;f4:S;f5:S;f6:S;f7:S;f8:S;f9:S;f10:S;

    init() {
        self.f1=S{i:1};self.f2=S{i:2};self.f3=S{i:3};self.f4=S{i:4};
        self.f5=S{i:5};self.f6=S{i:6};self.f7=S{i:7};self.f8=S{i:8};
        self.f9=S{i:9};self.f10=S{i:10};
    }
}
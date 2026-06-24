struct StrNest1 {
    text: String;
}

struct StrNest2 {
    nest: StrNest1;
}

struct StrNest3 {
    nest2: StrNest2;
}

contract StringDeepNest {
    deep: StrNest3;

    init() {
        self.deep = StrNest3{
            nest2: StrNest2{
                nest: StrNest1{ text:"deep" }
            }
        };
    }
}
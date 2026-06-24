struct Middle {
    a: Int;
}

struct Wrapper1 {
    f: Middle;
}

struct Wrapper2 {
    g: Wrapper1;
}

contract ReorderedNested {
    data: Wrapper2 = Wrapper2{
        g: Wrapper1{
            f: Middle{ a: 123 }
        }
    };
}
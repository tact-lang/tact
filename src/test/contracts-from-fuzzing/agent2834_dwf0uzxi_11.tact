struct SLevel1 {
    val: Int;
}

struct SLevel2 {
    inner: SLevel1;
}

struct SLevel3 {
    inner: SLevel2;
}

struct SLevel4 {
    inner: SLevel3;
}

struct SLevel5 {
    inner: SLevel4;
}

contract Deep5Nest {
    data: SLevel5;

    init() {
        self.data = SLevel5{
            inner: SLevel4{
                inner: SLevel3{
                    inner: SLevel2{
                        inner: SLevel1{ val: 100 }
                    }
                }
            }
        };
    }
}
struct InnerMost { val: Int; }
struct InnerOpt { inner: InnerMost?; }
struct Middle { opt: InnerOpt; }
struct Outer { mid: Middle; }

contract DeepOptStruct {
    st: Outer;

    init() {
        self.st = Outer{ mid: Middle{ opt: InnerOpt{ inner: null }}};
    }
}

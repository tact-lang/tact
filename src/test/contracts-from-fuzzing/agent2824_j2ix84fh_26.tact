struct InnerS { inner: Int }

contract DefaultVsSet {
    myVal: InnerS;

    init() {
        self.myVal = InnerS{ inner: 42 };
    }
}
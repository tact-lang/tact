struct StrangeInt {
    val: Int;
}

struct ContainerNZ {
    inner: StrangeInt;
    txt: String;
}

contract NegativeZeroTest {
    data: ContainerNZ;

    init() {
        self.data = ContainerNZ{
            inner: StrangeInt{
                val: -0,
            },
            txt: "zero",
        };
    }
}
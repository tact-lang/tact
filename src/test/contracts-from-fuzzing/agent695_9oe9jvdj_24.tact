struct Wrapper {
    content: String;
}

contract StringFieldTest {
    struc: Wrapper;

    init() {
        self.struc = Wrapper{content:"Hello"};
    }
}
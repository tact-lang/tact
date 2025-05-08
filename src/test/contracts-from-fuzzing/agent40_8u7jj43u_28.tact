struct Wrapper {
    str: String;
}

struct Outer {
    wrap: Wrapper?;
}

contract TestOptWrapper {
    data: Outer;

    init() {
        self.data = Outer{wrap:null};
    }

    receive() {
        let tmp = self.data;
    }
}
message Parent {
    child: Child;
}

message Child {
    data: Int;
}

contract Test {
    receive() {
        let p = Parent{child: Child{data: 99}};
    }
}
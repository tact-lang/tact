struct EmptyInitStruct {
    x: Int;
}

contract NoDefaultButInit {
    val: EmptyInitStruct;

    init() {
        self.val = EmptyInitStruct{x: 0};
    }
}

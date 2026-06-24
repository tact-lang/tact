struct NestedOptionalInStruct {
    x: Int?;
}

contract NestedOptInit {
    data: NestedOptionalInStruct?;

    init() {
        self.data = NestedOptionalInStruct{ x: 777 };
    }
}
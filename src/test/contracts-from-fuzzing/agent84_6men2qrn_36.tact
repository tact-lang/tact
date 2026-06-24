struct InnerS {
    field: Int;
}

contract FieldStructDefault {
    data: InnerS = InnerS{ field:7 };

    init() {
        self.data = InnerS{ field:8 };
    }
}
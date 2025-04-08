struct ManyOptionals {
    iopt: Int?;
    bopt: Bool?;
    sopt: String?;
}

contract OptionalStructs {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            iopt: 10,
            bopt: true,
            sopt: "hello"
        };
    }
}
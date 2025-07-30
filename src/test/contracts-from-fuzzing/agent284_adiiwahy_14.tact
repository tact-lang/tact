struct EmbedOptional {
    sub: SubStruct?;
}

struct SubStruct {
    data: Int;
}

contract OuterOptional {
    data: EmbedOptional;

    init() {
        self.data = EmbedOptional{
            sub: SubStruct{
                data: 555
            }
        };
    }
}
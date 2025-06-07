struct Embed {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract EmbedOptional {
    field: Embed?;

    init() {
        self.field = Embed{
            intVal: 777,
            boolVal: true,
            strVal: "Yep",
        };
    }
}

struct HasStringAndOptional {
    name: String;
    maybeVal: Int?;
}

contract StringOptField {
    s: HasStringAndOptional;

    init() {
        self.s = HasStringAndOptional{
            name:"x",
            maybeVal:null
        };
    }
}
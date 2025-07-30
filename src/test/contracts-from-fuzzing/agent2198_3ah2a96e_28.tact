struct TextHolder { text: String; }

contract OptionalStringStruct {
    opt_struct: TextHolder?;
    init() {
        self.opt_struct = TextHolder{text: "sample"};
    }
}
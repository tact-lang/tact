struct ManyOptionalDeep {
    s: String?;
    boolVal: Bool?;
    nested: InnerOptional?;
}

struct InnerOptional {
    intVal: Int?;
    flagVal: Bool?;
}

contract DeepOptionals {
    data: ManyOptionalDeep = ManyOptionalDeep{s: null, boolVal: null, nested: null};

    receive() {
        let _ = self.data;
    }
}
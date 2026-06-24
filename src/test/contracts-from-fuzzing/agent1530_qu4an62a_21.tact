struct MultipleOptionals {
    int_opt: Int?;
    bool_opt: Bool?;
    string_opt: String?;
}

contract StructOptionals {
    m: MultipleOptionals;

    init() {
        self.m = MultipleOptionals{
            int_opt: null,
            bool_opt: null,
            string_opt: null
        };
    }
}
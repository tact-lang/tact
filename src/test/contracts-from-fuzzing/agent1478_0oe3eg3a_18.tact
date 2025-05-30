struct NestedOptionals {
    first: Int?;
    second: Bool?;
    third: String?;
}

contract OptionalContract {
    data: NestedOptionals;
    init() {
        self.data = NestedOptionals{ first: null, second:true, third:null };
    }
}

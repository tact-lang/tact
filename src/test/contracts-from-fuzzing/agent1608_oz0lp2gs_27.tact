struct A { b: Bool; }
struct B { c: Int; }
struct BothOptFields {
    sa: A?;
    sb: B?;
}

contract MultiOptStructsContainer {
    val: BothOptFields;

    init() {
        self.val = BothOptFields{
            sa: A{ b:true },
            sb: null
        };
    }
}
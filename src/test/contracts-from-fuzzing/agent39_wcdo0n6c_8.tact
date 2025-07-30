struct Deeply {
    more: Int;
    nested: Int;
    fields: Int;
    than: Int;
    usual: Int;
    make: Int;
    bugs: Int;
    more2: Int;
    likely: Int;
    here: Int;
}

contract TestContract {
    val: Deeply;

    init() {
        self.val = Deeply{
            more:1, nested:2, fields:3, than:4, usual:5,
            make:6, bugs:7, more2:8, likely:9, here:10
        };
    }
}
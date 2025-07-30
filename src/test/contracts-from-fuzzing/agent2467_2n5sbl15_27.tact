struct Inner { val: Int; }

contract FieldContract {
    data: Inner;
    init() { self.data = Inner{ val: 5 }; }
}
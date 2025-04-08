struct NullableString { s: String?; }
struct WrapNullable { n: NullableString; }

contract WrappedNullable {
    v: WrapNullable;

    init() {
        self.v = WrapNullable{ n: NullableString{ s:null } };
    }
}
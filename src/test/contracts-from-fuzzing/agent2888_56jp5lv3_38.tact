// deeply nested chain combining init fields with contract params
struct X {
    note: String;
    flag: Bool?;
}

struct Y {
    xx: X?;
}

contract MixedDeep(
    y: Y?,
    extra: String?,
) {
    receive() {
        let _ = self.extra;
    }
}
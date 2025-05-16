// deep nested optional in param syntax
struct S2 {
    flag: Bool?;
    val: Int;
}

struct S1 {
    nested: S2?;
    innerVal: Int;
}

contract ParamDeep(
    field: S1?,
    fixed: Int,
) {
    receive() {
        let _ = self.fixed + 1;
    }
}
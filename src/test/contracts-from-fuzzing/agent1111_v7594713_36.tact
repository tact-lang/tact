// test combination: nested optional struct defaults
struct X {
 f: Int? = null;
 b: Bool = false;
}
contract NestedOptDef {
 x: X? = null;
 init() {}
}
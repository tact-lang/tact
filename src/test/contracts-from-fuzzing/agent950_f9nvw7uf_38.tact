// attempt initialize nested optional contract param and assign in constructor
struct S1 { foo: Int?; }
contract OptParamInit(
    optS1: S1?
) {
    // cannot use init here due to params, just test compile params
}
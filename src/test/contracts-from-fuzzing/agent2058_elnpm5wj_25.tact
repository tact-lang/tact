// contract parameter version deeply nested struct
struct X { val: Int }
struct Y { x: X }
struct Z { y: Y }

contract ParamDeep(
    nested: Z
) {}
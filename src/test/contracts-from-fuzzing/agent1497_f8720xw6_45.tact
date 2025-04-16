// contract param with nested struct chain
struct X { z: Int }
struct Y { inner: X }
contract C(
    item: Y
) {}
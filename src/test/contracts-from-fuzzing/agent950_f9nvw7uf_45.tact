// nested struct optionals chain on contract param
struct PC1 { pc2: PC2?; foo: Int?; }
struct PC2 { pc3: PC3?; bar: Bool?; }
struct PC3 { s: String?; }

contract ParamDeepChain(
    head: PC1?
) {}
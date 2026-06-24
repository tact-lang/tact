struct VariantOpt {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

struct Encapsulate {
    var1: VariantOpt?;
    var2: VariantOpt?;
}

contract MultiLayerOptional {
    mega: Encapsulate?;
}
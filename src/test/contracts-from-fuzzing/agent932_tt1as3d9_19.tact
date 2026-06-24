struct PSub { val: Int; }
struct POuter { sub: PSub; }

contract ParamsNested(
    data: POuter,
) {}
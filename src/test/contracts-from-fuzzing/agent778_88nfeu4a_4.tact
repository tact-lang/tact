struct Deep1 { x: Int }
struct Deep2 { deep1: Deep1 }
struct Deep3 { deep2: Deep2 }
struct Deep4 { deep3: Deep3 }
struct Deep5 { deep4: Deep4 }

contract DeepNestedStructs {
    field: Deep5 = Deep5{deep4: Deep4{deep3: Deep3{deep2: Deep2{deep1: Deep1{x: 5}}}}};

    init() {
        self.field = Deep5{deep4: Deep4{deep3: Deep3{deep2: Deep2{deep1: Deep1{x: 5}}}}};
    }
}
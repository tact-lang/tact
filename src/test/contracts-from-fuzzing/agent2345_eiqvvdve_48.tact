struct L1 { a: Int }
struct L2 { p: L1 }
struct L3 { p: L2 }
struct L4 { p: L3 }
struct L5 { p: L4 }
struct L6 { p: L5 }
struct L7 { p: L6 }
struct L8 { p: L7 }
struct L9 { p: L8 }
struct L10 { p: L9 }
struct L11 { p: L10 }
struct L12 { p: L11 }
struct L13 { p: L12 }
struct L14 { p: L13 }
struct L15 { p: L14 }

contract Deep15 {
    val: L15;
    init() {
        self.val = L15{
            p: L14{
                p: L13{
                    p: L12{
                        p: L11{
                            p: L10{
                                p: L9{
                                    p: L8{
                                        p: L7{
                                            p: L6{
                                                p: L5{
                                                    p: L4{
                                                        p: L3{
                                                            p: L2{
                                                                p: L1{ a: 42 }}}}}}}}}}}}}}};
    }
}
struct N1 { fld: Int }
struct N2 { fld: N1 }
struct N3 { fld: N2 }
struct N4 { fld: N3 }
struct N5 { fld: N4 }

contract TestContract {
    deep: N5;

    init() {
        self.deep = N5{
            fld: N4{
                fld: N3{
                    fld: N2{
                        fld: N1{
                            fld: 999
                        }
                    }
                }
            }
        };
    }
}
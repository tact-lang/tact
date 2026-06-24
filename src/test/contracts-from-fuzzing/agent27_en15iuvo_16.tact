struct OptA { a: Int? }
struct OptB { b: OptA? }
struct OptC { c: OptB? }

contract LayersOpt {
    s: OptC;

    init() {
        self.s = OptC{
            c: OptB{
                b: OptA{
                    a: 99
                }
            }
        };
    }
}
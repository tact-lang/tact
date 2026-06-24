struct AAA { x: Int }
struct BBB { x: AAA }
struct CCC { x: BBB }
struct DDD { x: CCC }
struct EEE { x: DDD }

contract FiveNest {
    x: EEE;

    init() {
        self.x = EEE{x:DDD{x:CCC{x:BBB{x:AAA{x:1}}}}};
    }
}
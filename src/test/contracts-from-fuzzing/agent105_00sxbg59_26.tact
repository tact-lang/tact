struct ChainA { f: Int }
struct ChainB { f: ChainA }
struct ChainC { f: ChainB }
struct ChainD { f: ChainC }
struct ChainE { f: ChainD }
struct ChainF { f: ChainE }
contract DeepAssign {
    val: ChainF;

    init() {
        self.val = ChainF{
            f: ChainE{
                f: ChainD{
                    f: ChainC{
                        f: ChainB{
                            f: ChainA{ f: 999 },
                        },
                    },
                },
            },
        };
    }
}
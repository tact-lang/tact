struct ChainA { next: ChainB?; val: Int }
struct ChainB { next: ChainC?; val: Int }
struct ChainC { next: ChainD?; val: Int }
struct ChainD { next: ChainE?; val: Int }
struct ChainE { next: ChainF?; val: Int }
struct ChainF { next: ChainG?; val: Int }
struct ChainG { next: ChainH?; val: Int }
struct ChainH { next: ChainI?; val: Int }
struct ChainI { next: ChainJ?; val: Int }
struct ChainJ { val: Int }

contract DeepOptionals {
    foo: ChainA;
    init() {
        self.foo = ChainA{
            next: ChainB{
                next: ChainC{
                    next: ChainD{
                        next: ChainE{
                            next: ChainF{
                                next: ChainG{
                                    next: ChainH{
                                        next: ChainI{
                                            next: ChainJ{ val: 99 },
                                            val: 9
                                        },
                                        val:8
                                    },
                                    val:7
                                },
                                val:6
                            },
                            val:5
                        },
                        val:4
                    },
                    val:3
                },
                val:2
            },
            val:1
        };
    }
}
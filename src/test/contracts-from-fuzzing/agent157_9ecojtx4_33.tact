struct DeeplyEmbedded {
    s1: Emb1;
}

struct Emb1 {
    s2: Emb2;
}

struct Emb2 {
    s3: Emb3;
}

struct Emb3 {
    s4: Emb4;
}

struct Emb4 {
    f: Int;
}

contract DeeplyEmbeddedTest {
    de: DeeplyEmbedded;

    init() {
        self.de = DeeplyEmbedded{
            s1: Emb1{
                s2: Emb2{
                    s3: Emb3{
                        s4: Emb4{
                            f: 999
                        }
                    }
                }
            }
        };
    }
}

struct Inner1 { val1: Int }
struct Inner2 { val2: Bool } 

struct TopStruct {
    s1: Inner1; 
    s2: Inner2;
}

contract MultipleEmbedded {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            s1: Inner1{ val1: 5 },
            s2: Inner2{ val2: false }
        };
    }
}
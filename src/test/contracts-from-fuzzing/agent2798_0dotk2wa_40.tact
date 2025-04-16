struct ChainWithNulls1 {
    next: ChainWithNulls2?;
}

struct ChainWithNulls2 {
    next: ChainWithNulls3?;
}

struct ChainWithNulls3 {
    value: Int?;
}

contract ChainWithNullsContract {
    data: ChainWithNulls1;

    init() {
        self.data = ChainWithNulls1{
            next: null
        };
    }
}
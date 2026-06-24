struct SOpt { so: Int? }

contract NilRoundtrip {
    field: SOpt?;

    init() {
        self.field = null;
    }
}

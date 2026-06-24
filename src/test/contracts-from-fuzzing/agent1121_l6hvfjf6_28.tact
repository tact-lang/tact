// Optional nested optional string (allowed? per nested optionals prohibition applies to types, not struct fields)

struct InnerOptional { s: String? }

struct OuterOptional { inner: InnerOptional? }

contract OptionalLayeredStruct {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{inner:null};
    }
}
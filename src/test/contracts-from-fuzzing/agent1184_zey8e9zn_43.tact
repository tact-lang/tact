struct MayOmit {
    a: Int;
}

contract OptCompositeOmit {
    foo: MayOmit?;

    init() {
        // uninitialized optionals should default to null
    }
}
import "@stdlib/deploy";

contract SampleTactContract with Deployable {
    init() {
    }
    get fun test_address(): Address {
        let a1: Address = address("FQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        return a1;
    }
}
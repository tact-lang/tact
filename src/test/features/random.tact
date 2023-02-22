import "@stdlib/deploy";

contract RandomContract with Deployable {

    init() {
        // do nothing
    }

    get fun randomInt(): Int {
        return randomInt();
    }

    get fun random(min: Int, max: Int): Int {
        return random(min, max);
    }
}
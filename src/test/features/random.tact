import "@stdlib/deploy";

contract RandomContract with Deployable {

    field: Int = 0;

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
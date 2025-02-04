import { asString, fromString } from "./path";

describe("fromString", () => {
    it("empty path", () => {
        expect(fromString("")).toMatchObject({ stepsUp: 0, segments: [] });
    });

    it("empty path segments: .///foo", () => {
        expect(fromString(".///foo")).toMatchObject({
            stepsUp: 0,
            segments: ["foo"],
        });
    });

    it("dot segments: /./foo", () => {
        expect(fromString("/./foo")).toMatchObject({
            stepsUp: 0,
            segments: ["foo"],
        });
    });

    it("double dot segments: ../foo", () => {
        expect(fromString("../foo")).toMatchObject({
            stepsUp: 1,
            segments: ["foo"],
        });
    });

    it("two double dot segments: ../../foo", () => {
        expect(fromString("../../foo")).toMatchObject({
            stepsUp: 2,
            segments: ["foo"],
        });
    });

    it("removed part: ../foo/../bar", () => {
        expect(fromString("../foo/../bar")).toMatchObject({
            stepsUp: 1,
            segments: ["bar"],
        });
    });

    it("removed parts: ../foo/../../bar", () => {
        expect(fromString("../foo/../../bar")).toMatchObject({
            stepsUp: 2,
            segments: ["bar"],
        });
    });
});

describe("asString", () => {
    it("empty path", () => {
        expect(asString(fromString(""))).toBe("");
    });

    it("empty path segments: .///foo", () => {
        expect(asString(fromString(".///foo"))).toBe("foo");
    });

    it("dot segments: /./foo", () => {
        expect(asString(fromString("/./foo"))).toBe("foo");
    });

    it("double dot segments: ../foo", () => {
        expect(asString(fromString("../foo"))).toBe("../foo");
    });

    it("two double dot segments: ../../foo", () => {
        expect(asString(fromString("../../foo"))).toBe("../../foo");
    });

    it("removed part: ../foo/../bar", () => {
        expect(asString(fromString("../foo/../bar"))).toBe("../bar");
    });

    it("removed parts: ../foo/../../bar", () => {
        expect(asString(fromString("../foo/../../bar"))).toBe("../../bar");
    });
});

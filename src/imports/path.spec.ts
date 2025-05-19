import { asString, fromString } from "@/imports/path";
import { step } from "@/test/allure/allure";

describe("fromString", () => {
    it("empty path", async () => {
        await step("RelativePath should match expected", () => {
            expect(fromString("")).toMatchObject({ stepsUp: 0, segments: [] });
        });
    });

    it("empty path segments: .///foo", async () => {
        await step("RelativePath should match expected", () => {
            expect(fromString(".///foo")).toMatchObject({
                stepsUp: 0,
                segments: ["foo"],
            });
        });
    });

    it("dot segments: /./foo", async () => {
        await step("RelativePath should match expected", () => {
            expect(fromString("/./foo")).toMatchObject({
                stepsUp: 0,
                segments: ["foo"],
            });
        });
    });

    it("double dot segments: ../foo", async () => {
        await step("RelativePath should match expected", () => {
            expect(fromString("../foo")).toMatchObject({
                stepsUp: 1,
                segments: ["foo"],
            });
        });
    });

    it("two double dot segments: ../../foo", async () => {
        await step("RelativePath should match expected", () => {
            expect(fromString("../../foo")).toMatchObject({
                stepsUp: 2,
                segments: ["foo"],
            });
        });
    });

    it("removed part: ../foo/../bar", async () => {
        await step("RelativePath should match expected", () => {
            expect(fromString("../foo/../bar")).toMatchObject({
                stepsUp: 1,
                segments: ["bar"],
            });
        });
    });

    it("removed parts: ../foo/../../bar", async () => {
        await step("RelativePath should match expected", () => {
            expect(fromString("../foo/../../bar")).toMatchObject({
                stepsUp: 2,
                segments: ["bar"],
            });
        });
    });
});

describe("asString", () => {
    it("empty path", async () => {
        await step("RelativePath should match expected string", () => {
            expect(asString(fromString(""))).toBe("");
        });
    });

    it("empty path segments: .///foo", async () => {
        await step("RelativePath should match expected string", () => {
            expect(asString(fromString(".///foo"))).toBe("foo");
        });
    });

    it("dot segments: /./foo", async () => {
        await step("RelativePath should match expected string", () => {
            expect(asString(fromString("/./foo"))).toBe("foo");
        });
    });

    it("double dot segments: ../foo", async () => {
        await step("RelativePath should match expected string", () => {
            expect(asString(fromString("../foo"))).toBe("../foo");
        });
    });

    it("two double dot segments: ../../foo", async () => {
        await step("RelativePath should match expected string", () => {
            expect(asString(fromString("../../foo"))).toBe("../../foo");
        });
    });

    it("removed part: ../foo/../bar", async () => {
        await step("RelativePath should match expected string", () => {
            expect(asString(fromString("../foo/../bar"))).toBe("../bar");
        });
    });

    it("removed parts: ../foo/../../bar", async () => {
        await step("RelativePath should match expected string", () => {
            expect(asString(fromString("../foo/../../bar"))).toBe("../../bar");
        });
    });
});

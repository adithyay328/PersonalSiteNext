import Image from 'next/image'

import HeadshotIntro from './faceHeader.tsx';

function SectionHeading(props : {text: string}) {
  return <h1 className="text-3xl font-normal">{props.text}</h1>;
};

function SectionGray(props : {children: React.ReactNode}) {
  return <div className="w-full bg-slate-100">
    <div className="w-6/12 m-auto mt-4">
      {props.children}
    </div>
  </div>;
};

function SectionWhite(props : {children: React.ReactNode}) {
  return <div className="w-full bg-white">
    <div className="w-6/12 m-auto">
      {props.children}
    </div>
  </div>;
};

function PaperLink(props : {link: string, text: string}) {
  return <a href={"paper_reviews/" + props.link} className="text-slate-800 underline">{props.text}</a>;
};

export default function Home() {
  return (
    // For styling the below, we separate sections by changing
    // the background b/w white and gray
    <>
      <div className="w-full">
        <div className="w-fit m-auto mt-4 gap-x-20">
          <HeadshotIntro />
        </div>
      </div>

      <SectionGray>

        <SectionHeading text="Paper Reviews" />
        <p className="m-auto mt-4">Below are some papers I've reviewed in the past. These are meant to be really quick
        pages explaining what the paper is all about, and discussing the context behind it. I add some of my own interpretations
        of the papers, and hopefully these are useful for people who are interested in the papers but don't have the time to read
        the whole thing.
        </p>

        <PaperLink link="nerf" text="NeRF: Representing Scenes as Neural Radiance Fields for View Synthesis"/>

      </SectionGray>
    </>
  )
};
"use client"

import { useState } from 'react';

import Image from 'next/image'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faGithub } from '@fortawesome/free-brands-svg-icons';
import { faLinkedin } from '@fortawesome/free-brands-svg-icons';

export default function HeadshotIntro() {
  const headshot = <Image src="/Headshot.jpeg" alt="Headshot" width={225} height={225} className="rounded-full"/>
  
  // We make the linked in remark visible based on this variable
  const [isVisible, setIsVisible] = useState(false);
  const className = isVisible ? "opacity-100" : "opacity-0";

  const linkedInReachOut = <p className={className}>Please reach out to me on LinkedIn, I respond the most on there.</p>

  return <>
    <div className="flex flex-row gap-4">
      {headshot}
      <div className="h-fit m-auto">
        <p className=" text-3xl font-normal">Adi Yerramsetty </p>
        {/* <br></br> */}
        <p className="text-slate-800 text-lg">Teaching machines to see</p>
        <div className="flex flex-col gap-3 w-4/5">
          <div className="flex flex-row gap-3">
            <FontAwesomeIcon size="2xl" icon={faGithub}/>
            <FontAwesomeIcon size="2xl" icon={faLinkedin}/>
            <button className="bg-slate-800 text-white rounded w-3/5"
            onClick={() => setIsVisible(!isVisible)}
            >Contact Me</button>
          </div>
          {linkedInReachOut}
        </div>
      </div>
    </div>
  </>
}